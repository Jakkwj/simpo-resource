===================
Sludge_pro
===================
.. 标明日期（要用上面说过的规范）
.. 标明分类（采用英文）。规范如下git：

.. 'Added' 添加的新功能
.. 'Changed' 功能变更
.. 'Deprecated' 不建议使用，未来会删掉
.. 'Removed' 之前不建议使用的功能，这次真的删掉了
.. 'Fixed' 改的bug
.. 'Security' 改的有关安全相关bug


.. toctree::
    :hidden:




2022-05-11
====================

- Changed

  - Match with web version improve.





2022-04-13
====================


- Fixed

  - Fixed lots of bugs and Test lots of situation, seems ok

- Changed

  - Fortran input parameters should not get initial value in declaration. If you set a initial value to a parameter in declaration, it will get "save" effect, everytime OpenMP call Get_Kernel_Evaluation(), this parameter will be accumulated.
  - Component in Get_Kernel_Evaluation() has been set to intent(in).
  - BioComponent_rollback also gets detection_limit to prevent Grid_dt_second become 0 under euler_forward condiction.


2022-03-24
====================

- Changed

  - Inflow and flow evaluation seems ok.
  - Improved fortran code under evaluation condiction:
    - Evaluation scope now has 5 parts:
      - paramter
      - initial value of component
      - volume
      - initial value of inflow
      - initial value of flow
    - Input module will not assign if the scope are all false, for example, if we are conducting OAT evaluation, and all paramters are False(not evaluated), then, Parameter_OAT will not appear in Input and main_Evaluation module. In this case, computer memory will be saved a little, and increase some calculation speed.




2022-03-22
====================

- Added

  - Trying inflow and flow evaluation




2022-02-20
====================

- Changed


  - Fixed result_pro.py bugs in result_file initial.

    - Initial result_file will be created correctly right now.
    - Result_file will be close correctly right now.





2022-02-19
====================

- Addded

  - Making solution_pro._get_group().
