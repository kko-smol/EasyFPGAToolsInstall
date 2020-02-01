# OpenFPGATools
> An easier way to quickly build, install, and update latest builds of the FOSS FPGA flows

Open Source FPGA toolkit built around [IceStorm](http://www.clifford.at/icestorm/) and [Yosys](http://www.clifford.at/yosys/) by [Claire Wolf](http://www.clifford.at/). Version 2 now includes ECP5 support via [Prjtrellis](https://github.com/SymbiFlow/prjtrellis) and Gowin via [Apicula](https://github.com/pepijndevos/apicula).

## Install locally (brew || sudo apt-get)
* For Ice40 use:
```
./icetools.sh
```
* For ECP5 use: 
```
./ecp5tools.sh
```
* For Gowin use:
```
./gowintools.sh
```
* For all architectures use: 
```
./fpgatools.sh
```

## Toolchain

| Component                                            | Function      | License                                              |
|------------------------------------------------------|---------------|------------------------------------------------------|
| [Yosys](http://www.clifford.at/yosys/)               | Synthesis     | [ISC](https://opensource.org/licenses/ISC)           |
| [Icarus Verilog](http://iverilog.icarus.com/)        | Simulation    | [GPL-2.0](https://opensource.org/licenses/GPL-2.0)   |
| [Verilator](https://www.veripool.org/wiki/verilator) | Simulation    | [LGPL-3.0](https://opensource.org/licenses/LGPL-3.0) |
| [Arachne-pnr](https://github.com/cseed/arachne-pnr)  | Place & Route | [MIT](https://opensource.org/licenses/MIT)           |
| [IceStorm](http://www.clifford.at/icestorm/)         | Bitstream     | [ISC](https://opensource.org/licenses/ISC)           |
| [NextPNR](https://github.com/YosysHQ/nextpnr)        | Place & Route | [ISC](https://opensource.org/licenses/ISC)           |
| [Prjtrellis](https://github.com/SymbiFlow/prjtrellis)| Bitstream     | [MIT](https://opensource.org/licenses/MIT)           |
| [Apicula](https://github.com/pepijndevos/apicula)    | Bitstream     | [MIT](https://opensource.org/licenses/MIT)           |


## Supported FPGAs

* Lattice iCE40 (all variants)
* Lattice ECP5 (all vairants)
* Gowin GW1N-1 / GW1NR-9

## Issues
Gowin support is ***experimental*** via Project Apicula 

### OS X

To unload the default and vendor drivers in case `iceprog` refuses to connect:
```
sudo kextunload -v -b com.apple.driver.AppleUSBFTDI
sudo kextunload -v -b com.FTDI.driver.FTDIUSBSerialDriver
```

Reload with
```
sudo kextload -v -b com.apple.driver.AppleUSBFTDI
sudo kextload -v -b com.FTDI.driver.FTDIUSBSerialDriver
```
