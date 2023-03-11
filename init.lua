require('core.options')

require('core.lazy').lazy_init() -- plugin manager

require('core.lazy').mapping() -- plugin mapping for lazy-loading

require('core.environment')

require('core.mapping')

require('core.menu')

require('core.utils').set_theme({ -- set light theme and dark theme
  'ayu-light',
}, {
  'sonokai',
})
