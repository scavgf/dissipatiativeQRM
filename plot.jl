using DelimitedFiles
using LaTeXStrings
using Plots

#read data from files
function loadData(gx::String, gy::String)
    name="./data/gap-omega0-1.0-Omega="*gy*"-lambda="*gx*"-dim=400.dat"
    data=readdlm(name)[:,[1,4]]
    data[:,1], data[:,2]
end
x1,y1=loadData("1.0","1000.0")
x2,y2=loadData("1.05","1000.0")
x3,y3=loadData("1.1","1000.0")
x4,y4=loadData("1.15","1000.0")
x5,y5=loadData("1.2","1000.0")
x6,y6=loadData("1.25","1000.0")
x7,y7=loadData("1.3","1000.0")
x8,y8=loadData("1.35","1000.0")
x9,y9=loadData("1.4","1000.0")
labels=[L"\gamma/\omega_0", L"\Delta/\omega_0"]
plt=plot(x1, [-y1 -y2 -y3 -y4 -y5 -y6 -y7 -y8],yscale=:log10, labels=["g=1.0" "g=1.05" "g=1.1" "g=1.15" "g=1.2" "g=1.25" "g=1.3" "g=1.35" "g=1.4"],framestyle = [:box :semi :origin :zerolines :grid :none])
xlabel!(L"\gamma/\omega_0")
ylabel!(L"\Delta/\omega_0")
xlims!(0.0,10)
ylims!(0.0001,0.2)
display(plt)

function loadData(gx::String, gy::String)
    name="./data/gap-omega0-1.0-Omega="*gy*"-lambda="*gx*"-dim=500.dat"
    data=readdlm(name)[:,[1,4]]
    data[:,1], data[:,2]
end
x1,z1=loadData("1.0","1200.0")
x2,z2=loadData("1.1","1200.0")
x3,z3=loadData("1.25","1200.0")
x4,z4=loadData("1.35","1200.0")
#plt1=plot(x1, [-y1 -z1 -y3 -z2 -y6 -z3 -y8 -z4],yscale=:log10,framestyle = [:box :semi :origin :zerolines :grid :none])
#xlabel!(L"\gamma/\omega_0")
#ylabel!(L"\Delta/\omega_0")
#xlims!(0.0,10)
#ylims!(0.0001,0.2)
#display(plt1)