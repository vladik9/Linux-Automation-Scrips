# Fix NVIDIA Driver Installation Issues on Ubuntu

## Problem Statement

When attempting to install NVIDIA drivers on Ubuntu using the command:

```bash
sudo ubuntu-drivers install
```

You may encounter the following error:

```
The following packages have unmet dependencies:
nvidia-driver-570 : Depends: nvidia-kernel-source-570 but it is not going to be installed
E: Unable to correct problems, you have held broken packages.
```

## Root Cause

This issue occurs due to:

- Conflicting or broken NVIDIA packages already installed.
- Missing or outdated repositories.
- Held or broken packages on the system.

---

## Solution

### Step 1: Remove Existing NVIDIA Drivers

First, purge any existing NVIDIA drivers to avoid conflicts:

```bash
sudo apt-get purge '^nvidia-.*'
```

### Step 2: Clean Up the Package List

Update the package list and clean up broken packages:

```bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get --fix-broken install
sudo apt-get autoremove
sudo apt-get autoclean
```

### Step 3: Add the Required PPA

Add the graphics drivers PPA to your system:

```bash
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
```

### Step 4: Check Available Drivers

List the recommended NVIDIA drivers for your system:

```bash
ubuntu-drivers devices
```

### Step 5: Install the Recommended Driver

Install the recommended driver automatically:

```bash
sudo ubuntu-drivers autoinstall
```

### Step 6: Install Specific Driver Version (Optional)

If you want a specific version (e.g., `nvidia-driver-570`), use:

```bash
sudo apt-get install nvidia-driver-570
```

### Step 7: Reboot Your System

After the installation, restart your computer:

```bash
sudo reboot
```

### Step 8: Verify Installation

After rebooting, check if the driver is correctly installed:

```bash
nvidia-smi
```

---

## Troubleshooting

### Check for Held Packages

Sometimes packages may be held back from installation:

```bash
sudo dpkg --get-selections | grep hold
```

### Force Installation of Missing Dependencies

If the error persists, force installation of required packages:

```bash
sudo apt-get install -f
```

### Manual Cleanup of Conflicting Packages

If conflicts persist, manually remove problematic packages:

```bash
sudo apt-get remove --purge nvidia-*
sudo apt-get install nvidia-driver-570
```

---

## Verification

After completing the steps, verify the driver installation with:

```bash
nvidia-smi
```

You should see details about your NVIDIA GPU and the installed driver.

---

## License

This script and documentation are provided as-is. Use at your own risk.
