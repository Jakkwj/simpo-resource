===========
.. Sludge
Simpo
===========


.. .. toctree::
..     :hidden:
..     :caption: Client
..     :titlesonly:

..     Client/index

.. .. toctree::
..     :hidden:
..     :caption: Template
..     :titlesonly:



.. .. toctree::
..     :hidden:
..     :caption: Picture
..     :titlesonly:

..     Picture/index


.. .. toctree::
..     :hidden:
..     :caption: Tutorials
..     :titlesonly:

..     Tutorials/quick_start


.. .. toctree::
..     :hidden:
..     :caption: Explanation
..     :titlesonly:

..     模块/index

.. .. toctree::
..     :hidden:
..     :caption: about

..     about
..     ChangeLog/index


    .. :hidden:
.. toctree::
    :caption: Resource

    Client
    Template
    Picture/index









.. Welcome to Sludge's documentation.

.. Introduction
.. ==============


.. Sludge is a **SaaS platform** for calculating the matrix like biochemical models (such as activated sludge models 1, 2 and 3). The aim of this project is to help people to build and calculate their own wasterwater treatment process easily.
.. The input of the whole process are only 3 excel xlsx files. By this way, you can check and make your own biological model conveniently.


.. The core ideas of **OpenASM** platform are:

.. - **Simple**: provides a convenient solution to simulate and evaluate the modles and datas, at most 3 xlsx files and you are good to go.
.. - **Composable**: one can arbitrary combine the modles and datas only if the model's components are the same as the data's targets.
.. - **Sharable**: modles and datas can be reused and shared to the community.
.. - **Trackable**: all the algorithms are open source, the modle's structure and the data authenticity can be tracked effectively.


.. .. The key features are:

.. .. - **Simple**:

.. ..   + only 3 excel files and you are good to go
.. .. - **Composable**
.. .. - **Sharable**
.. .. - **Trackable**



.. .. This is a demo site for |theme_display|, generated as part of
.. .. `Sphinx Themes Gallery <https://sphinx-themes.org>`_.

.. ^^^^^

.. Time Unit
.. ==============
.. To unify the time unit in Sludge calcualtion, all time units will translated to ``'second'``.
.. There are 2 time units we should notice: **Parameter** and **Measured**.

.. Parameter
.. --------------
.. NOTE that Parameter time unit is fixed to be ``'day'`` and unchangable.
.. The Unit column in Parameter sheet of **BioModel.xlsx** is actually an annotation, it won't affect any calculation result.

.. For instant, if you set ``b_OHO_end`` (the endogenous respiration rate coefficient of ordinary heterotrophic organisms) to be 0.008 h :sup:`-1`, it will be recognized as 0.008 d :sup:`-1` rather than 0.2 d :sup:`-1` as you might expect.
.. So even for interpreted purpose, you should always set the time unit to be ``'day'`` in Unit column.


.. Measured
.. --------------
.. Measured time unit is setted in the TimeUnit column (only 1st row) in Tank sheet of **DataSet.xlsx**, which could only be: ``'second'``, ``'minute'``, ``'hour'`` or ``'day'``.
.. The Component (Measured sheet) and Flow (Link sheet) data will follow this time unit.






.. ^^^^^






.. Snapshot
.. ===========
.. .. image:: _static/images/Fig5__Sim_Targets__.png
    :align: center
    :width: 7in
    :height: 3.3in
.. .. image:: _static/images/Project__Eva_UncertaintyPCDF__(59).png
    :align: center
    :width: 7in
    :height: 3.3in

.. ^^^^^

.. .. important::
    :align: center
    :width: 7in
    :height: 3.3in

..     Let's Build Models Together.



.. .. important::
    :align: center
    :width: 7in
    :height: 3.3in

..     This sample documentation was generated on |today|, and is rebuilt weekly.



