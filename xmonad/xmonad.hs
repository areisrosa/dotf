import XMonad

main = xmonad $ def { terminal = "st -e tmux"
                    , borderWidth = 1
                    }
