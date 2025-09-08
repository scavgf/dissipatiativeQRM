module Dissipators #generate the Rabi Hamiltonian

########################################
include("./Consts.jl")
include("./Hamiltonian.jl")
using LinearAlgebra
using SparseArrays
using .Consts: sigma0, sigmax, sigmaz
using .Hamiltonian: HOa 
import ..Consts:Parameters

#Harnomic osscilator anhinilation operator
########################################
#dissipator for harmonic oscillator relaxation
function dissipatorH(dim::Int64) 
    a=HOa(dim)
    A=kron(sigma0,a)
    N=kron(sigma0,a'*a)
    I0=sparse(I, 2*dim,2*dim)
    diss= 2.0.*kron(A,A)- kron(N,I0)-kron(I0,N)
    return diss
end
########################################
#dissipator for spin relaxation
function dissipatorS(dim::Int64) 
   Ia=sparse(I, dim, dim)
   sn=sparse([0 0; 1.0 0])
   s0=sparse([1.0 0; 0 0])
   Sn=kron(sn, Ia)
   S0=kron(s0, Ia)
   I0=sparse(I, 2*dim,2*dim)
   diss=2.0*kron(Sn,Sn)-kron(S0,I0)-kron(I0,S0)
   return diss
end
########################################
end
	
