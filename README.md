# SYSTEM_EXORCISM
 SYSTEM EXORCISM INITIATED   Windows is about to behave.                        
SYSTEM EXORCISM
Controlled Lethal Repair for Windows

SYSTEM_EXORCISM.bat is an aggressive but controlled Windows cleanup and repair script designed to eliminate cache rot, update corruption, explorer glitches, and accumulated system junk — then repair what remains.

This is not a tweak pack.
This is not a booster.
This is a hard reset of Windows housekeeping, followed by integrity repair.

⚠️ IMPORTANT WARNINGS

Must be run as Administrator or it will exit immediately.

Explorer will be killed and restarted during execution.

Windows Update services are stopped, caches wiped, then restarted.

System File Checker (SFC) will run and may take time.

A reboot is strongly recommended after completion.

Do not run this:

During critical work

While downloads or updates are active

On systems you do not control

✅ WHAT THIS SCRIPT DOES
1. Administrative Validation

Verifies admin privileges before doing anything destructive.

2. Service Shutdown

Stops known Windows noise sources:

Windows Update (wuauserv)

Background Intelligent Transfer Service (bits)

Delivery Optimization (dosvc)

This prevents locked files and cache rebuild loops.

3. Explorer Termination

Force-kills explorer.exe

Prevents cache rebuilds during deletion

Explorer is restarted at the end

4. Full Cache & Temp Purge

Deletes and rebuilds:

User %TEMP%

C:\Windows\Temp

C:\Windows\Prefetch

This clears:

Orphaned installers

Crashed app remnants

Broken prefetch traces

5. Windows Update Cache Reset

Deletes C:\Windows\SoftwareDistribution

Recreates a clean directory

Fixes:

Update stuck at 0%

Infinite “Checking for updates”

Corrupt update metadata

6. Browser Cache Removal

Clears cache folders for:

Google Chrome

Microsoft Edge

Targets cache only, not profiles or logins.

7. Icon & Thumbnail Cache Reset

Deletes:

Icon cache

Thumbnail cache

Fixes:

Blank icons

Incorrect thumbnails

Explorer visual glitches

8. Memory & Garbage Collection

Clears recycle bin

Forces .NET garbage collection

Helps flush:

Idle memory debris

Long-running session clutter

9. Component Store Cleanup (Safe Mode)

Runs:

DISM /Online /Cleanup-Image /StartComponentCleanup


This safely removes:

Superseded components

Update leftovers

Does not reset Windows or remove features.

10. System File Repair

Runs:

sfc /scannow


Checks and repairs:

Corrupted system files

Broken Windows components

This is the longest step.

11. Service & Explorer Restore

Restarts all previously stopped services

Relaunches Explorer cleanly

🧠 WHAT THIS IS GOOD FOR

Sluggish Windows installs

Broken Windows Update

Explorer crashes or glitches

Long uptime systems

Dev machines full of junk

“Windows feels haunted” situations

🚫 WHAT THIS IS NOT

Not a registry cleaner

Not a gaming FPS booster

Not a telemetry remover

Not a privacy tool

Not reversible

It cleans what Windows is meant to clean but often doesn’t.

▶️ HOW TO USE

Right-click SYSTEM_EXORCISM.bat

Select Run as Administrator

Let it finish

Reboot

📄 FILE
SYSTEM_EXORCISM.bat


Single file. No dependencies. No downloads.

🧯 DISCLAIMER

You run this at your own risk.
The script uses standard Windows commands but performs destructive cleanup by design.

If you don’t understand what it does, don’t run it.
