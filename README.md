<p align="center">
    <img src="images/thonkpad.gif" />
</p>

# ThinkPad P14s Gen 4 — Linux

Various configs for Lenovo ThinkPad P14s Gen 4 running under GNU/Linux distributions.

## Sound

The default speaker sound is terrible, so the repository includes an [EasyEffects](https://github.com/wwmm/easyeffects) preset to make it better. This includes a mix of a modified LoudnessEqualizer preset from [https://github.com/Digitalone1/EasyEffects-Presets](https://github.com/Digitalone1/EasyEffects-Presets) and a Music/Movies convolver effect config taken from P14s G3 Windows installation. To install the presets, just run the following command:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/m4tx/thinkpad-p14s-g4-linux/master/install_easyeffects.sh)"
```