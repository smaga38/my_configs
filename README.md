# my_configs
## Install vim plugins
package directory contains two sub-directories:

start/ - contains plugins that will be automatically loaded

opt/ - contains plugins that are loaded on demand with **:packadd**

It may seem a bit complicated, but in practice all you have to do is add your plugin here:

<pre>
              ↓ package name
~/.vim/pack/bundle/start/some-plugin
        ↑ packages dir      ↑ plugin dir
</pre>

On Windows: use ~\vimfiles\pack\ instead of ~/.vim/pack/

By convention, we've used the package name "bundle" as the directory that will contain all our plugins. You can use any name you want, and you can even put your plugins in separate package directories if you really want to.
<pre>
Example: Installing sensible.vim  
mkdir -p ~/.vim/pack/bundle/start
cd ~/.vim/pack/bundle/start
git clone https://github.com/tpope/vim-sensible.git
</pre>

**On Windows: use ~\vimfiles\pack\ instead of ~/.vim/pack/**

Next time you start Vim, the plugin will load automatically.
