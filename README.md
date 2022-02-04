# CNC Setup

This repository contains an Ansible playbook for installing CNC related tools on Ubuntu 20.04 based systems. Those tools are:

- Candle
  ![Candle working](./docs/images/candle.png)
- g-code-utils
  ![g-code-utils working](./docs/images/gcode_utils.png)
- FlatCAM
  ![FlatCAM working](./docs/images/flatcam.png)

## Tools / Applications installed

### [g-code-utils](https://github.com/alvarogimenez/g-code-utils) from [alvarogimenez](https://github.com/alvarogimenez)

Used for double side PCB making, this Java application will let you turn the board and align it on your cnc with the already generated Gcode.

### [Candle](https://github.com/Denvi/Candle) from [Denvi](https://github.com/Denvi)

Send the Gcode to the board. Similar to the universal Gcode sender.

### [FlatCAM](http://flatcam.org/) from [jpcgt]() & [Marius Stanciu]()

Gerber to PCB conversion.

**NOTES:**

- I had to switch to the `Beta` branch as `master` was somehow not working on 20.04 Ubuntu based systems, seems to be using old libraries and still pointing to the dead Python 2.7
- I had an issue also with 2 libraries:
  - `vispy` which I had to downgrade to `0.7.0`
  - `svglib` by default does not have any version pinned to it so downgrading to `1.1.0` made it work.
  - Installed packages as per 04/Feb/2022 are listed [here.](./docs/04_02_2022_python3_packages.txt)


## Executing this ansible playbook.

- ### **Automated script installation. :racing_car:**

  ```shell
  wget -q -O - https://raw.githubusercontent.com/yeyeto2788/cnc_setup/main/setup_cnc.sh | bash
  ```

- ### **Execution via `ansible-pull` :metal:**

  ```shell
  ansible-pull -K --url https://github.com/yeyeto2788/cnc_setup.git main.yaml
  ```

- ### **Manual execution. :cry:**

  ```shell
  git clone https://github.com/yeyeto2788/cnc_setup.git
  cd cnc_setup
  ansible-playbook main.yaml -K -u $USER
  ```