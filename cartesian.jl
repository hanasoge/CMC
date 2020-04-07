using OffsetArrays
using DelimitedFiles
using Printf
using FITSIO
using FFTW
using WignerSymbols
using PyPlot
using JLD

const freqmin = 2500
const freqmax = 5500
const kmin = 2 
const kmax = 150
const qmin = 1
const qmax = 50

a=read(FITS("ModeCoup/V.fits")[2])

const nx = size(a)[1]
const ny = size(a)[2]
const nt = size(a)[3]
const dt = 45.0
const sigmax = 15.0

dat = fft(a)/(nx*ny*nt)
a=[];

nus = OffsetArray(1e6 * ifftshift(-nt/2:Int(floor((nt-1)/2.0)))/(nt*dt),0:nt-1)
kx = OffsetArray(1e6 * ifftshift(-nx/2:Int(floor((nx-1)/2.0)))/(nx*dx),0:nx-1)
ky = OffsetArray(1e6 * ifftshift(-ny/2:Int(floor((ny-1)/2.0)))/(ny*dy),0:ny-1)
if (mod(nt,2)*2 == nt) nu[nt/2+1] == -nu[nt/2+1]; end;
if (mod(nx,2)*2 == nx) kx[nx/2+1] == -kx[nx/2+1]; end;
if (mod(ny,2)*2 == ny) ky[nt/2+1] == -ky[ny/2+1]; end;

kay = [ kx[i]^2. + ky[j]^2. for i=0:nx-1, j=0:ny-1 ]

dkx = kx[2] - kx[1]
dky = ky[2] - ky[1]
dnu = nus[2] - nus[1]

nsig = floor(sigmax/dnu)+1
sigs = OffsetArray(0:nsig-1,0:nsig-1)*dnu
qx = OffsetArray
qy = OffsetArray


que = [ kx[i]^2. + ky[j]^2. for i=0:nqx-1, j=0:nqy-1 ]

for k in 0:(nsig-1)
 for j in 0:(nqx-1)
  for i in 0:(nqx-1)
   bcoef[i,j,k]
  end
 end
end
