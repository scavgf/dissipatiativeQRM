module Hamiltonian #generate the Rabi Hamiltonian

########################################
include("./Consts.jl")
using LinearAlgebra
using SparseArrays
using .Consts: sigma0, sigmax, sigmaz
import ..Consts:Parameters

export Hoa, Rabi
#
#Harnomic osscilator anhinilation operator
function HOa(dim::Int64) 
	x_list=[1:dim-1;]
	y_list=[2:dim;]
	value=[sqrt(ix) for ix=1:dim-1]
	M=sparse(x_list,y_list,value,dim,dim)
	return M
end
########################################
#Harnomic osscilator anhinilation operator
function Rabi(dim::Int64, params::Parameters) 
	a=HOa(dim)
	n=a'*a
	X=(a+a')./sqrt(2.0)
	IM=sparse(I,dim,dim)
	H=params.omega0.*kron(sigma0, n)+params.Omega/2.0.*kron(sigmaz, IM)+params.lambda*kron(sigmax,X)
	return H
end
########################################
end
	
