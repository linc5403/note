# zsh vim mode
[oh-my-zsh/plugins/vi-mode at master · robbyrussell/oh-my-zsh · GitHub](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/vi-mode)

<!-- toc -->

- [vi-mode](#vi-mode)
  * [History](#History)
  * [Mode indicators](#Mode-indicators)
  * [Vim edition](#Vim-edition)
  * [Movement](#Movement)
  * [Insertion](#Insertion)
  * [Delete and Insert](#Delete-and-Insert)
  * [按键时延](#%E6%8C%89%E9%94%AE%E6%97%B6%E5%BB%B6)

<!-- tocstop -->


vi-mode
=======

This plugin increase`vi-like`zsh functionality.

Use`ESC`or`CTRL-[`to enter`Normal mode`.

[History](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/vi-mode#history)
----------------------------------------------------------------------------------------

*   `ctrl-p`: Previous command in history
*   `ctrl-n`: Next command in history
*   `/`: Search backward in history
*   `n`: Repeat the last`/`

[Mode indicators](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/vi-mode#mode-indicators)
--------------------------------------------------------------------------------------------------------

_Normal mode_is indicated with red`<<<`mark at the right prompt, when it wasn't defined by theme.

[Vim edition](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/vi-mode#vim-edition)
------------------------------------------------------------------------------------------------

*   `v`: Edit current command line in Vim

[Movement](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/vi-mode#movement)
------------------------------------------------------------------------------------------

*   `$`: To the end of the line
*   `^`: To the first non-blank character of the line
*   `0`: To the first character of the line
*   `w`: /[count/] words forward
*   `W`: /[count/] WORDS forward
*   `e`: Forward to the end of word /[count/] inclusive
*   `E`: Forward to the end of WORD /[count/] inclusive
*   `b`: /[count/] words backward
*   `B`: /[count/] WORDS backward
*   `t{char}`: Till before /[count/]'th occurrence of {char} to the right
*   `T{char}`: Till before /[count/]'th occurrence of {char} to the left
*   `f{char}`: To /[count/]'th occurrence of {char} to the right
*   `F{char}`: To /[count/]'th occurrence of {char} to the left
*   `;`: Repeat latest f, t, F or T /[count/] times
*   `,`: Repeat latest f, t, F or T in opposite direction

[Insertion](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/vi-mode#insertion)
--------------------------------------------------------------------------------------------

*   `i`: Insert text before the cursor
*   `I`: Insert text before the first character in the line
*   `a`: Append text after the cursor
*   `A`: Append text at the end of the line
*   `o`: Insert new command line below the current one
*   `O`: Insert new command line above the current one

[Delete and Insert](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/vi-mode#delete-and-insert)
------------------------------------------------------------------------------------------------------------

*   `ctrl-h`: While in_Insert mode_: delete character before the cursor
*   `ctrl-w`: While in_Insert mode_: delete word before the cursor
*   `d{motion}`: Delete text that {motion} moves over
*   `dd`: Delete line
*   `D`: Delete characters under the cursor until the end of the line
*   `c{motion}`: Delete {motion} text and start insert
*   `cc`: Delete line and start insert
*   `C`: Delete to the end of the line and start insert
*   `r{char}`: Replace the character under the cursor with {char}
*   `R`: Enter replace mode: Each character replaces existing one
*   `x`: Delete /[count/] characters under and after the cursor
*   `X`: Delete /[count/] characters before the cursor




## 按键时延
.zshrc  

```
export KEYTIMEOUT=1
```

