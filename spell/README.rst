Spell checking in Vim
=====================

Error E763
==========

To correct vim error E763 under Ubuntu, remove incorrect spell checking
files::

    $ sudo rm /usr/share/vim/vimcurrent/spell/*.{sug,spl}
    $ sudo vim

Download new ones::

    $ sudo vim
    $ set spell spelllang=en,fr

.. vim: filetype=rst textwidth=79
