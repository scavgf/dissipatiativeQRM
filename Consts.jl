module Consts #generate the Rabi Hamiltonian
using SparseArrays

export sigma0, sigmax, sigmaz, Parameters
########################################
const sigma0=sparse([1.0 0; 0 1.0])
const sigmax=sparse([0 1.0; 1.0 0])
const sigmaz=sparse([1.0 0; 0 -1.0])
########################################
mutable struct Parameters
	omega0::Float64
	Omega::Float64
	lambda::Float64
end
########################################
end
	
