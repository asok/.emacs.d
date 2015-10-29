(beacon-mode 1)
(setq beacon-blink-when-focused t)

(defadvice evil-window-middle (after asok/beacon-blink activate)
  (beacon-blink))
