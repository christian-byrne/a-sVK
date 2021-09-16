# Auto Start Virtual Keyboard

#### Contents

<!-- TOC -->

- [Auto Start Virtual Keyboard](#auto-start-virtual-keyboard)
            - [Contents](#contents)
    - [References](#references)
    - [Install](#install)
    - [Definitions](#definitions)
    - [Usage](#usage)
        - [Using Barrier from Terminal as a Client](#using-barrier-from-terminal-as-a-client)
    - [Process Diagram](#process-diagram)

<!-- /TOC -->

I removed all peripherals from some linux systems in my house. I was using them through ssh and by connecting my main keyboard using the [barrier](https://github.com/debauchee/barrier) program (based on the [Synergy 1.9 Codebase](https://en.wikipedia.org/wiki/Synergy_(software))).

Certain events, however, would crash or disconnect the virtual keyboard switch and consequently require changing the config or restarting barrier. But I could not access those systems correctly in order to do so. 

These scripts automate the tedious process of restarting barrier on the linux systems through an SSH session with the correct IP and configurations.




## References

<details>
    <summary>Expand</summary>
    
- [Example barrier config files for different OS](https://github.com/debauchee/barrier/tree/master/doc)
- [Barrier Command Line Docs](https://github.com/debauchee/barrier/wiki/Command-Line)
- [Barrier Repo](https://github.com/debauchee/barrier)
- [Synergy Wiki](https://github.com/symless/synergy-core/wiki)
- [Using SSH on Windows Subsystems](https://www.illuminiastudios.com/dev-diaries/ssh-on-windows-subsystem-for-linux/)
- [ssh into exec command](https://stackoverflow.com/questions/18522647/run-ssh-and-immediately-execute-command/18522811)
- [Using `pkill` to kill processes by name](https://stackoverflow.com/questions/13910087/shell-script-to-capture-process-id-and-kill-it-if-exist)
- [Get PIDs by name using `pidof`](https://www.cyberciti.biz/faq/linux-find-process-name/)
</details>

## Install

```bash
sudo apt install barrier
```

## Definitions

- `server` = Main windows system that is connected to the keyboard
- `host` = linux subsystem on the server system
- `client` = any number of separate linux systems


## Usage

1. Copy scripts in each folder `server`, `host`, `client`, to their respective systems
2. Give execution permissions where necessary
3. Start the `host` linux subsystem
4. Create an alias for (or just run) the `start-ssh` script (`$HOME/start-ssh`)

### Using Barrier from Terminal as a Client

```bash
barrierc [--yscroll <delta>] [--display <display>] 
[--no-xinitthreads] [--daemon|--no-daemon] 
[--name <screen-name>] [--restart|--no-restart] 
[--debug <level>] <server-address>
```



## Process Diagram

<details>
    <summary>Expand</summary>

1. Get IP of linux systems by scanning network
1. Get IP of server through `ipconfig`
2. Open linux subsystem on main
3. Run script to ssh to each linux system, then execute scripts on those systems with correct configurations
4. Reload/start barrier on main
</details>

