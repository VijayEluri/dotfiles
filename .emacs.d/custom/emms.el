(add-to-list 'load-path "/usr/share/emacs/site-lisp/emms/")
(require 'emms-setup)
(emms-devel)
(emms-default-players)

;(setq emms-info-asynchronously nil)
;(setq emms-playlist-buffer-name "*EMMS Playlist*")

; emms-add-*, emms-play-*
(global-set-key (kbd "C-c a") 'emms-start)
(global-set-key (kbd "C-c s") 'emms-stop)
(global-set-key (kbd "C-c n") 'emms-next)
(global-set-key (kbd "C-c p") 'emms-previous)
;(global-set-key (kbd "C-c r") 'emms-shuffle)
(global-set-key (kbd "C-c r") 'emms-random)
(global-set-key (kbd "C-c c") 'emms-pause)
;(global-set-key (kbd "C-c b") 'emms-browser-add-tracks-and-play)
;(global-set-key (kbd "C-c s") 'emms-smart-browse)
;(global-set-key (kbd "<kp-left>") 'emms-seek)
(global-set-key (kbd "<kp-left>") 'emms-seek-backward)
(global-set-key (kbd "<kp-right>") 'emms-smart-forward)

(setq emms-repeat-playlist nil)

(setq emms-show-format "Now Playing: %s")
(add-hook 'emms-player-started-hook 'emms-show)

;(setq emms-source-file-default-directory "/mnt/media/music")

; emms-playlist-new, emms-playlist-save
;(require 'emms-playlist-sort)

;(require 'emms-mode-line)
;(emms-mode-line t)

;(require 'emms-playing-time)
;(emms-playing-time t)
; emms-playing-time-[enable disable toggle]

;(require 'emms-info-libtag)
;(set emms-info-functions '(emms-info-libtag))

(require 'emms-player-mpd)
(setq emms-player-mpd-server-name "aleph0")
(setq emms-player-mpd-server-port "6600")
(add-to-list 'emms-info-functions 'emms-info-mpd)
(add-to-list 'emms-player-list 'emms-player-mpd)
(setq emms-player-mpd-music-directory "/mnt/media/music")
;; emms-player-mpd-connect, emms-browser, emms-playlist-mode-go

;(require 'emms-streams)
;(require 'emms-lastfm)
;(emms-lastfm-enable)