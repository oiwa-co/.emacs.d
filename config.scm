;; This is an operating system configuration generated
;; by the graphical installer.
;;
;; Once installation is complete, you can learn and modify
;; this file to tweak the system configuration, and pass it
;; to the 'guix system reconfigure' command to effect your
;; changes.


;; Indicate which modules to import to access the variables
;; used in this configuration.
(use-modules (gnu))
(use-package-modules gnome freedesktop gnome-xyz)
(use-service-modules cups desktop networking ssh xorg)

(operating-system
 (locale "en_US.utf8")
 (timezone "America/Bogota")
 (keyboard-layout (keyboard-layout "us"))
 (host-name "yuanjiao")

 ;; The list of user accounts ('root' is implicit).
 (users (cons* (user-account
                (name "aisak")
                (comment "Aisak")
                (group "users")
                (home-directory "/home/aisak")
                (supplementary-groups '("wheel" "netdev" "audio" "video")))
               %base-user-accounts))

 ;; Packages installed system-wide.  Users can also install packages
 ;; under their own account: use 'guix search KEYWORD' to search
 ;; for packages and 'guix install PACKAGE' to install a package.
 (packages (append
	    (list (specification->package "emacs")
                  (specification->package "emacs-exwm")
                  (specification->package
                   "emacs-desktop-environment")
		  (specification->package "sbcl")
		  (specification->package "ncurses")
		  (specification->package "adwaita-icon-theme")
		  (specification->package "alacritty"))
            %base-packages))

 ;; Below is the list of system services.  To search for available
 ;; services, run 'guix system search KEYWORD' in a terminal.
 (services
  (append
   (list
    (service gnome-desktop-service-type
	     (gnome-desktop-configuration
	      (core-services (list accountsservice
				   evolution-data-server  
				   network-manager
				   packagekit
				   upower))
	      (shell (list glib-networking
			   gnome-backgrounds
			   gnome-color-manager
			   gnome-control-center
			   gnome-desktop
			   gnome-initial-setup
			   gnome-keyring
			   gnome-menus
			   gnome-session
			   gnome-settings-daemon
			   gnome-shell
			   gnome-shell-extensions
			   gnome-themes-extra
			   gnome-user-docs
			   gnome-user-share
			   gsettings-desktop-schemas
			   gnome-shell-extension-dash-to-dock
			   mutter))
	      (utilities (list evince
			       eog
			       gnome-calendar
			       desktop-file-utils
			       gnome-screenshot
			       nautilus
			       )) 
	      (extra-packages (list dconf))))
    (service tor-service-type)
    (service openssh-service-type)
    (set-xorg-configuration
     (xorg-configuration (keyboard-layout keyboard-layout))))
   %desktop-services))

 
 (bootloader (bootloader-configuration
              (bootloader grub-efi-bootloader)
              (targets (list "/boot/efi"))
              (keyboard-layout keyboard-layout)))
 (swap-devices (list (swap-space
                      (target (uuid
                               "24a14841-4530-49db-bee8-efda934bdf3a")))))

 ;; The list of file systems that get "mounted".  The unique
 ;; file system identifiers there ("UUIDs") can be obtained
 ;; by running 'blkid' in a terminal.
 (file-systems (cons* (file-system
                       (mount-point "/")
                       (device (uuid
                                "b3288f51-cd62-4c97-83de-1da7092a79ec"
                                'ext4))
                       (type "ext4"))
                      (file-system
                       (mount-point "/boot/efi")
                       (device (uuid "71DC-CD82"
                                     'fat32))
                       (type "vfat")) %base-file-systems)))
