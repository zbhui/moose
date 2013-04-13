[Mesh]
  file = square.e
[]

[Variables]
  active = 'u v'

  [./u]
    order = FIRST
    family = LAGRANGE
  [../]

  [./v]
    order = FIRST
    family = LAGRANGE
  [../]
[]

[Preconditioning]
  active = 'FSP'

  [./FSP]
    type = FSP
    full = true
    off_diag_row    = 'v'
    off_diag_column = 'u'
    split_type  = additive
  [../]
[]

[Kernels]
  active = 'diff_u conv_v diff_v'

  [./diff_u]
    type = Diffusion
    variable = u
  [../]

  [./conv_v]
    type = CoupledForce
    variable = v
    v = u
  [../]

  [./diff_v]
    type = Diffusion
    variable = v
  [../]
[]

[BCs]
  active = 'left_u right_u left_v'

  [./left_u]
    type = DirichletBC
    variable = u
    boundary = 1
    value = 0
  [../]

  [./right_u]
    type = DirichletBC
    variable = u
    boundary = 2
    value = 100
  [../]

  [./left_v]
    type = DirichletBC
    variable = v
    boundary = 1
    value = 0
  [../]

  [./right_v]
    type = DirichletBC
    variable = v
    boundary = 2
    value = 0
  [../]
[]

[Executioner]
  type = Steady

  petsc_options       = '-snes_mf_operator -snes_view -snes_monitor -snes_converged_reason -ksp_monitor -ksp_converged_reason'
  petsc_options_iname = '-dm_moose_nfieldsplits -dm_moose_fieldsplit_0_vars -dm_moose_fieldsplit_1_vars    -pc_type  -pc_fieldsplit_type -pc_fieldsplit_schur_precondition' 
  petsc_options_value = '                     2                           u                           v  fieldsplit                schur                              self'                     
[]

[Output]
  file_base = fsp_schur_full_self_out
  output_initial = true
  interval = 1
  exodus = true
  perf_log = true
[]


