# AutoHealSA
 A simple mod that replicates GTA V's healing behaviour in GTA SA.

## How does it work?

When CJ gets damaged, a short timer will start counting down. Once that timer reaches zero, CJ will begin healing. If CJ gets hurt during the count down of the timer or the healing process, the timer will reset. CJ will also not fully heal if his health reaches below 50%, instead he will only heal to 50% and will have to seek medical attention (or go eat some burgershot).

## Installation

Simply drop the .asi file which you can get from the releases section in your scripts folder.

---

### This mod uses the following libraries:
* [plugin-sdk](https://github.com/DK22Pac/plugin-sdk)
