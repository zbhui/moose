/****************************************************************/
/*               DO NOT MODIFY THIS HEADER                      */
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*           (c) 2010 Battelle Energy Alliance, LLC             */
/*                   ALL RIGHTS RESERVED                        */
/*                                                              */
/*          Prepared by Battelle Energy Alliance, LLC           */
/*            Under Contract No. DE-AC07-05ID14517              */
/*            With the U. S. Department of Energy               */
/*                                                              */
/*            See COPYRIGHT for full restrictions               */
/****************************************************************/

#ifndef VARIABLERESIDUALNORMSDEBUGOUTPUT_H
#define VARIABLERESIDUALNORMSDEBUGOUTPUT_H

// MOOSE includes
#include "BasicOutput.h"
#include "PetscOutput.h"
#include "FEProblem.h"

// Forward declerations
class VariableResidualNormsDebugOutput;

template<>
InputParameters validParams<VariableResidualNormsDebugOutput>();

/**
 * A class for producing various debug related outputs
 *
 * This class may be used from inside the [Outputs] block or via the [Debug] block (preferred)
 */
class VariableResidualNormsDebugOutput : public BasicOutput<PetscOutput>
{
public:

  /**
   * Class constructor
   * @param name Output object name
   * @param parameters Object input parameters
   */
  VariableResidualNormsDebugOutput(const InputParameters & parameters);
  VariableResidualNormsDebugOutput(const std::string & deprecated_name, InputParameters parameters); // DEPRECATED CONSTRUCTOR

  /**
   * Class destructor
   */
  virtual ~VariableResidualNormsDebugOutput();

protected:

  /**
   * Perform the debugging output
   */
  virtual void output(const ExecFlagType & type);

  /// Reference to libMesh system
  TransientNonlinearImplicitSystem & _sys;

};

#endif // VARIABLERESIDUALNORMSDEBUGOUTPUT_H
