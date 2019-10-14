Rails.application.routes.draw do

  get 'turkeytote/ret'

  get 'turkeytote/retnj'

  get 'turkeytote/retil'

  get 'turkeytote/consumer'

  get 'turkeytote/consumernj'

  get 'turkeytote/consumeril'

  get 'turkeytote/consumerga'

  get 'turkeytote/consumertx'

  get 'turkeytote/consumerco'

  get 'turkeytote/fs'

  get 'turkeytote/fsnj'

  get 'turkeytote/fsil'

  get 'turkeytote/fstx'

  get 'turkeytote/fsga'

  get 'turkeytote/fsco'

  get 'turkeytote/totals'

  get 'turkeytote/totalsnj'

  get 'turkeytote/totalsil'

  get 'turkeytote/totalsga'

  get 'turkeytote/totalstx'

  get 'turkeytote/totalsco'

  root 'turkeytote#totals'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
