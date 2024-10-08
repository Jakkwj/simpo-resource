===================
Sludge
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






2022-05-20
====================

- Changed

  - DataSet empty input seems ok.





2022-05-11
====================

- Improved

  - Match with web version improve.



2022-05-02
====================

- Changed

  - Solution Weight input format changed.



2022-04-26
====================

- Added

  - solution._check_matrix_initial_value(), to avoid a division by zero error.

- Changed

  - DataSet.Flow can be empty.







2022-04-13
====================

- Added

  - Unit and Target has been seperated in DataSet input excel file.
  - Target has been seperated in Solution input excel file.

- Fixed

  - Fixed lots of bugs and Test lots of situation, seems ok






2022-04-05
====================

- Added

  - Target in DataSet.Inflow will be converted to Component:

    - Loop each Inflow, if there are targets which cannot find in component, convert them
    - Find the sum relation in Solution.conversion, and then find the proportional relationship in Solution.variable
    - Inflow will convert all the targets into components
    - Then, Inflow will be calculation correctly
    - If all the targets in Inflow are the same as components, then it won't convert.

  - Unit will be add in Component plotter.






2022-03-22
====================

- Added

  - Trying inflow and flow evaluation




trying inflow and flow evaluation

2022-02-23
====================

- Changed


  - Logic of Grouping has changed a lot:

    - A BioModel.Matrix Group describes the sum of some Components equal to a certain value in any circumstances. A Group is actually a constraint, so Group Components cannot be simply random when conducting LHS/GA evaluation.
    - A BioModel.Matrix Group cannot contain overlap Components and Components value must be number(not a Parameter), cause we don't support this kind of evaluation yet.
    - Solution.Varable Group Sum of Component_Tank must be equal to DataSet.Measured Target initial value, and must be equal to corresponding Group Sum(default Group Sum) in BioModel.Matrix Group.
    - Only a BioModel.Matrix Group will be sync with Evaluation status(solution_pro._sync_group_component_evaluation()), rather than a Group from Solution.Conversion.








2022-02-20
====================

- Changed


  - Fixed result.py bugs in result_file initial

    - Result_file will be close correctly right now.



2022-02-19
====================

- Changed

  - Upgrading grouping comment in biomodel._get_group().



2022-01-23
====================

- Added

  - Add Component sheet in BioModel input xlsx file:

    - Add Unit and Name infomation in Component sheet.
    - Unit will be used in plot later.
    - Component order and name must be exactly the same as in Matrix sheet

  - Add Typer class in Checker to wrap some common type, such as pd.DataFrame can be use as Typer.df


- Changed

  - Improve some checker



2022-01-03
====================

- Changed

  - The motive of calculation.detection_limit(``1.0e-30`` by default) has changed:

    - Now calculation.detection_limit forces the biocomponent equal to it while biocomponent less than it.
    - For instance: if ``biocomponent(1) < 1.0e-30``, then ``biocomponent(1) = 1.0e-30``.
    - By this way, it will make steady state easier(hopefully).
    - NOTE: this method has not been tested yet.




2021-12-19
====================
- Added

  - Unit column in Parameter(2nd column) sheet of BioModel.xlsx.
  - Unit row in Matrix sheet(2nd row) of BioModel.xlsx.

- Changed

  - The calculation.detection_limit was not contorl to cut to 0.
