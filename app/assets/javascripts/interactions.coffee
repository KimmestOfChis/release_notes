$(document).on "turbolinks:load", ->
    $("#plt_crossline_dep").on 'click', ->
        $('#plt_dep_dets').toggle()
    $('#pc_changes').on 'click', ->
        $('#pc_changes_details').toggle()
     $('#ia_changes').on 'click', ->
        $('#ia_changes_details').toggle()
    $('#plugin_changes').on 'click', ->
        $('#plug_changes_type').toggle()
    $('#db_script').on 'click', ->
        $('#db_script_type').toggle()
    $('#external_changes').on 'click', ->
        $('#external_changes_type').toggle()