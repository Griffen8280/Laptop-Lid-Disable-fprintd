# Laptop-Lid-Disable-fprintd
A script and systemd service to watch for laptop lid events and either enable/disable fprintd

To setup just install the script into /opt/lidswitch/    
  `sudo mkdir /opt/lidswitch/ && sudo cp laptop-lid.sh /opt/lidswitch/`

Then run:     
  `sudo cp lidswitchevent.service /etc/systemd/system/`    
  `sudo systemctl daemon-reload`    
  `sudo systemctl enable --now lidswitchevent.service`    

This should then install and run the service that runs the laptop-lid.sh script.  Anytime you open your laptop lid the script sees the switch state change (`cat /proc/acpi/button/lid/*/state`) from closed->open and the script will then enable the fprintd system to watch for fingerprint events.  When you close your laptop lid the state changes from open->closed and the script then turns off the fprintd system to default you back to using passwords for sudo and other functions while your machine is docked.

Of course feel free to update the path of where you install the script, just remember to update the .service file with the new path or it won't work.
