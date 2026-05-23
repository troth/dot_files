# Kitty Configuration

Generate a sample config for reference from the installed kitty binary:

    $ kitty +runpy 'from kitty.config import *; print(commented_out_default_config())' > kitty.conf-sample
