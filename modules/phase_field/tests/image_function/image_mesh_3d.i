[Mesh]
  type = ImageMesh
  dim = 3
  file_base = stack/test
  file_suffix = png
[]

[Variables]
  [./u]
  [../]
[]

[Functions]
  [./image_func]
    # ImageFunction gets its file range parameters from ImageMesh,
    # when it is present.  This prevents duplicating information in
    # input files.
    type = ImageFunction
  [../]
[]

[ICs]
  [./u_ic]
    type = FunctionIC
    function = image_func
    variable = u
  [../]
[]

[Problem]
  type = FEProblem
  solve = false
[../]

[Executioner]
  # Preconditioned JFNK (default)
  type = Transient
  num_steps = 1
  dt = 0.1
[]

[Outputs]
  output_initial = true
  exodus = true
  [./console]
    type = Console
    perf_log = true
    nonlinear_residuals = false
    linear_residuals = false
  [../]
[]