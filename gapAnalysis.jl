########################################
include("./Consts.jl")
include("./Hamiltonian.jl")
include("./Dissipators.jl")
using LinearAlgebra
using SparseArrays
using Arpack 
using .Consts: sigma0, sigmax, sigmaz
using .Hamiltonian: HOa, Rabi 
using .Dissipators: dissipatorH, dissipatorS 
import ..Consts:Parameters

#parameters to be used
dim=400
omega0=1.0
Omega=1000.0
kappa=0.5
lambda0=sqrt(omega0*Omega/2.0)*sqrt(1+(kappa/omega0)^2)
factor=parse(Float64, ARGS[1])
lambda=factor*lambda0
###################################
#lindblad of the dissipative quantum rabi model 
params=Parameters(omega0,Omega,lambda)
I0=sparse(I, 2*dim,2*dim)
H=Rabi(dim, params)
Dkappa=dissipatorH(dim)
Dgamma=dissipatorS(dim)
L0=-im.*(kron(H,I0)-kron(I0, H))+kappa.*Dkappa
###file for recording results
file=open("data/gap-omega0-"*string(omega0)*"-Omega="*string(Omega)*"-lambda="*string(factor)*"-dim="*string(dim)*".dat","w")

for ix=1:4
        gamma=0.1*ix
        L=L0+gamma.*Dgamma
        evals, evecs, info = eigs(L; nev=2, sigma= -0.0005, tol=1e-6)
        println("Number of converged eigenvalues: ", info)
        println("ix=", ix," Smallest magnitude eigenvalues: ", evals)
        vals=sort(evals,by= abs)
        write(file, join([gamma, real(vals[2])], " "), "\n")
end
close(file)
###determine the smallest eigenvalues of the lindblad
#vals=eigvals(Matrix(L))
#println("vals=",vals)
########################################
