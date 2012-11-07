@reply_links = ->
  $('.tree_block .comments .reply a').click ->
    console.log 'clicked'
    false

$ ->
  ############################################
  # Build Sortable Tree
  ############################################
  # Select all trees JSON data and build it
  for data_block in $ '.comments_tree'
    # Init
    data_block  = $ data_block
    klass       = data_block.find('.klass').html()
    plural      = data_block.find('.plural').html()
    rebuild_url = data_block.find('.rebuild_url').html()

    # Data
    t    = JSON.parse data_block.find('.locale').html()
    tree = JSON.parse data_block.find('.data').html()

    # Build tree
    tree_html = render_tree tree,
      klass:       klass
      plural:      plural
      locale:      t
      rebuild_url: rebuild_url

    # Append tree html after JSON data block
    tree_block = $("<div class='tree_block' />").insertAfter(data_block)
    tree_block.append """
      <ol class='comments'>
        #{tree_html}
      </ol>
      <div class='comments_new'>
        <a href='/#{plural}/new'>#{t.new_comment}</a>
      </div>
    """

$ ->
  reply_links()