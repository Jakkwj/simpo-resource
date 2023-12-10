#!/usr/bin/env bash


function if_client_not_running(){
    # find 'SimpoClient'  but not 'SimpoClient_setup' process, then stop
    # ps -ef | grep 'SimpoClient' | grep -v grep
    # if [ $? -eq 0 ]
    # then

    # if ps -ef | grep 'SimpoClient' | grep -v grep; then  # can find SimpoClient process

        # ps -ef | grep 'SimpoClient_setup' | grep -v grep
        # if [ $? -ne 0 ]
        # then
        # if !(ps -ef | grep 'SimpoClient_setup' | grep -v grep); then  # but not find SimpoClient_setup process
    echo ""
    if (ps -ef | grep 'SimpoClient' | grep -v grep) && !(ps -ef | grep 'SimpoClient_installer' | grep -v grep); then
        echo " -> SimpoClient is running, please close the program and try again!"
        # sleep 7
        # runing='true'
        return 1  # un normal
        # fi
    else
        return 0  # normal
    fi
}


function mk_program_dir(){

    if [ ! -d /opt/${program_name} ]; then  # only mk dir if it is not exist
        mkdir /opt/${program_name}
        echo " -> SimpoClient program folder has been created."
        # echo ""
    # else
    #     echo " -> SimpoClient program folder already exists."
        # echo ""
    fi

    # if [ ! -d /home/$USER/.${program_name} ]; then  # 新建项目文件夹
    # if [ ! -d /home/$SUDO_USER/.${program_name} ]; then  # 新建项目文件夹
    #     # mkdir ~/.${program_name}
    #     mkdir /home/$SUDO_USER/.${program_name}
    #     echo " -> SimpoClient data folder has been created."
    #     # echo ""
    # else
    #     echo " -> SimpoClient data folder already exists."
    #     # echo ""
    # fi

    # rm -rf ~/.${program_name}/bin  # 删除 bin 文件夹, 后续下载后重新建立

    # if [ ! -d /home/$USER/.SimpoClient/bin ]; then
    #     mkdir ~/.SimpoClient/bin
    #     echo " -> SimpoClient program folder has been created."
    # else
    #     echo " -> SimpoClient program folder already exists."
    # fi

    # if [ ! -d /home/$USER/.${program_name}/projects ]; then  # 新建项目文件夹
    #     mkdir ~/.${program_name}/projects
    #     echo " -> Sludge working folder has been created."
    # else
    #     echo " -> Sludge working folder already exists."
    # fi
    # if [ ! -d /home/$USER/.local/bin ]; then
    if [ ! -d /home/$SUDO_USER/.local/bin ]; then  # only mk dir if it is not exist
        mkdir /home/$SUDO_USER/.local/bin
        # echo " -> local bin folder has been created."
        # echo ""
    # else
        # echo " -> local bin folder already exists."
        # echo ""
    fi

}


function mk_data_dir(){  # should mk later than mk_program_dir
    # $USER: root user,$SUDO_USER: current user
    if [ ! -d /home/$SUDO_USER/.${program_name} ]; then  # only mk dir if it is not exist
        mkdir /home/$SUDO_USER/.${program_name}
        chown $SUDO_USER /home/$SUDO_USER/.${program_name}/  # change ownership to current user
        chgrp $SUDO_USER /home/$SUDO_USER/.${program_name}/  # change owener group to current use
        echo " -> SimpoClient data folder has been created."
        # echo ""
    else
        echo " -> SimpoClient data folder already exists."
        # echo ""
    fi
}


function rm_program_dir(){  # # remove folder if exist

    if [ -d /opt/${program_name} ]; then
        rm -rf /opt/${program_name}
        echo " -> SimpoClient program folder has been removed."
        # echo ""
    fi

}


function download_untar(){  # 下载解压主程序
    # cd /home/$SUDO_USER/.local/bin
    # 下载解压后改名, 最后删除
    # wget -O ${program_name}.tar.xz $main_url/api/download/client/linux

    release_os=$(lsb_release -i --short)
    release_num=$(lsb_release -r --short)

    if [[ $release_os =~ 'Ubuntu' ]]; then  # 16/18 将不再支持
        # if [[ $release_num =~ '16' ]] || [[ $release_num =~ '18' ]]; then
        #     # download_url=$main_url/api/download/client/linux/ubuntu1618
        #     # download_url=https://sludge.readthedocs.io/en/latest/_downloads/3b731107ff8abe8682d304cef8450ad8/SimpoClient_0.2.1_no_tray.tar.xz
        #     download_url=https://sludge.readthedocs.io/en/latest/_downloads/95384bf756f919adea2289f9071010d5/SimpoClient_no_tray.tar.xz
        # else
            # download_url=$main_url/api/download/client/linux/ubuntu20
            # download_url=https://sludge.readthedocs.io/en/latest/_downloads/3b652b7f2f48f380e8701ed0831509ca/SimpoClient_0.2.1.tar.xz
        download_url=https://sludge.readthedocs.io/en/latest/_downloads/315600e96ff680047cd50155abd4ac7f/SimpoClient.tar.xz
        # fi
    fi

    if wget -O ${program_name}.tar.xz $download_url ; then
        tar -xvf ${program_name}.tar.xz
        # mv ${program_name}.dist bin
        mv ${program_name}.dist/* /opt/${program_name}
        rm -r ${program_name}.dist
        rm ${program_name}.tar.xz

        # cd bin
        chmod -R 777 ${program_name}
        echo " -> SimpoClient has been downloaded and created."
        # echo ""
        ln -fs /opt/${program_name}/${program_name} /home/$SUDO_USER/.local/bin/
        return 0  # normal
    else
       echo ' -> Cannot download SimpoClient right now, please try again later or contact to the administrator.'
    #    echo ""
       return 1  # un normal
    fi
}


function mk_uninstall(){  # run uninstall by: sudo /opt/SimpoClient/uninstall.sh
    echo "#!/usr/bin/env bash" > uninstall.sh
    echo "" >> uninstall.sh
    echo "" >> uninstall.sh

    echo "function if_client_not_running(){" >> uninstall.sh
    echo "    echo ''" >> uninstall.sh
    echo "    if ps -ef | grep 'SimpoClient' | grep -v grep && !(ps -ef | grep 'SimpoClient/uninstall' | grep -v grep); then" >> uninstall.sh
    echo "        echo ' -> SimpoClient is running, please close the program and try again!'" >> uninstall.sh
    echo "        return 1  # un normal" >> uninstall.sh
    echo "    else" >> uninstall.sh
    echo "        return 0  # normal" >> uninstall.sh
    echo "    fi" >> uninstall.sh
    echo "}" >> uninstall.sh
    echo "" >> uninstall.sh
    echo "" >> uninstall.sh

    echo "function uninstall(){" >> uninstall.sh
    echo "    echo ''" >> uninstall.sh
    echo "    echo '>>> Removing SimpoClient... <<<'" >> uninstall.sh
    echo "    echo ''" >> uninstall.sh

    echo "    read -p ' -> Do you want to remove SimpoClient data folder? [y/N] ' choice_remove" >> uninstall.sh
    echo "    if [ -z \$choice_remove ]; then  # if empty or N" >> uninstall.sh
    # echo "        :  # pass" >> uninstall.sh
    echo "        echo '  -> Keep the SimpoClient data folder, you can remove it manually in: ~/.sluge_client'" >> uninstall.sh
    echo "    elif [ \$choice_remove == 'y' ] || [ \$choice_remove == 'Y' ]; then  # y/Y" >> uninstall.sh
    echo "        rm -f -r "/home/$SUDO_USER/.${program_name} >> uninstall.sh
    echo "        echo ' -> SimpoClient data folder has been removed. <<<'" >> uninstall.sh
    echo "    fi" >> uninstall.sh
    echo "    echo ''" >> uninstall.sh

    # echo "rm -f -r ~/.SimpoClient" >> uninstall.sh
    echo "    rm -f -r /opt/"${program_name} >> uninstall.sh
    echo "    echo ' -> SimpoClient program folder has been removed. <<<'" >> uninstall.sh
    # echo "    rm -f ~/.local/bin/SimpoClient" >> uninstall.sh
    echo "    rm -f "/home/$SUDO_USER/.local/bin/${program_name} >> uninstall.sh
    echo "    echo ' -> SimpoClient executable program link has been removed. <<<'" >> uninstall.sh
    echo "    rm -f "/home/$SUDO_USER/.local/share/applications/${program_name}".desktop" >> uninstall.sh
    echo "    echo ' -> SimpoClient desktop file has been removed. <<<'" >> uninstall.sh
    echo "    echo ''" >> uninstall.sh
    echo "    echo '>>> SimpoClient has been removed successfully. <<<'" >> uninstall.sh
    echo "}" >> uninstall.sh
    echo "" >> uninstall.sh
    echo "" >> uninstall.sh

    # echo "runing='false'" >> uninstall.sh
    # echo "if_process_running" >> uninstall.sh
    # echo "if [ ${runing} == 'false' ]" >> uninstall.sh
    # echo "then" >> uninstall.sh
    echo "read -p ' -> Do you want to remove SimpoClient? [y/N] ' choice_uninstall" >> uninstall.sh
    echo "if [ -z \$choice_uninstall ]  # if empty or N" >> uninstall.sh
    echo "then" >> uninstall.sh
    echo "    :  # pass" >> uninstall.sh
    echo "elif [  \$choice_uninstall == 'y' ] || [  \$choice_uninstall == 'Y' ]; then  # y/Y" >> uninstall.sh
    echo "    if if_client_not_running; then  # only start while not calculation is running" >> uninstall.sh
    echo "        uninstall" >> uninstall.sh
    echo "    fi" >> uninstall.sh
    echo "fi" >> uninstall.sh
    echo "" >> uninstall.sh

    chmod -R 777 uninstall.sh
    echo " -> SimpoClient uninstall shell has been created."
    # echo ""
    echo "" >> uninstall.sh
}


function make_url_protocol(){  # url 协议中不能带下划线!
    cd /home/$SUDO_USER/.local/share/applications
    # cd /usr/share/applications
    echo "[Desktop Entry]" > ${program_name}.desktop
    echo "Version=1.0" >> ${program_name}.desktop
    # echo "Name=SludgeClient" >> ${program_name}.desktop
    echo Name=${program_name} >> ${program_name}.desktop
    echo "GenericName="${program_name} >> ${program_name}.desktop
    echo "Comment=Simpo calculation callable function" >> ${program_name}.desktop
    echo "Type=Application" >> ${program_name}.desktop
    # echo "Exec="${program_name_lowercase}" %u" >> ${program_name}.desktop  # 这里放实际命令, 而不是 url 协议
    echo "Exec="${program_name}" %u" >> ${program_name}.desktop  # 这里放实际命令, 而不是 url 协议
    echo "Icon=/opt/SimpoClient/package/icon/logo.png" >> ${program_name}.desktop  # 这里放实际命令, 而不是 url 协议
    echo "Terminal=false" >> ${program_name}.desktop
    echo "StartupNotify=false" >> ${program_name}.desktop
    # echo "MimeType=x-scheme-handler/sludgeclient" >> ${program_name}.desktop  # url 协议中不能带下划线!
    echo MimeType=x-scheme-handler/${program_name_lowercase} >> ${program_name}.desktop  # url 协议中不能带下划线, 且必须小写
    update-desktop-database /home/$SUDO_USER/.local/share/applications
    # update-desktop-database /usr/share/applications
    echo " -> SimpoClient desktop file has been created."
    # echo ""
}


function main(){
    # version 0.0.2.2 (2023.06.10)

    if [ -z $SUDO_USER ]  # must run this shell with 'sudo'
    then
        echo " -> Please run SimpoClient Setup with 'sudo'"
    else

        # main_url=http://127.0.0.1:5000
        # main_url=http://localhost:9000
        program_name='SimpoClient'
        program_name_lowercase='simpoclient'
        can_remove='false'
        # runing='false'  # 默认 sluge client 没有在运行

        # if_process_running
        # if [ ${runing} == 'false' ]  #　不在运行才进行安装
        # then

        if if_client_not_running; then  # only start while not calculation is running
            echo ""
            echo ">>> SimpoClient is installing... <<<"
            echo ""



            # mk_program_dir

            # if !(cd /opt/${program_name}); then  # only mk dir if it is not exist
            if [ ! -d /opt/${program_name} ]; then  # only mk dir if it is not exist
                mk_program_dir
                can_remove='true'
            else
                rm_program_dir
                mk_program_dir
                can_remove='true'
            fi

            cd /opt/${program_name}
            if download_untar; then
                mk_data_dir
                mk_uninstall
                make_url_protocol
                echo ""
                echo ">>> SimpoClient has been installed successfully. <<<"
            else
                ${can_remove} == 'true' && rm_program_dir  # only remove when create program folder from not exist
                echo ""
                echo ">>> SimpoClient failed to install, please try again later. <<<"
            fi
        fi
    fi

}

# main

rm_program_dir
