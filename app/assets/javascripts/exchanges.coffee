$(document).ready ->

   $('form').submit (e) ->
    e.preventDefault();

   ### Button change currency ###

   $('#button_change_currency').click ->
    target = $('#target_currency').val();
    source = $('#source_currency').val();

    $('#target_currency option').each ->
     if $(this).val() == source
      $('#amount').val("");
      $('#result').val("");
      $(this).prop('selected',true);
      return false

    $('#source_currency option').each ->
     if $(this).val() == target
      $(this).prop('selected',true);
      return false
    
   #### Calculate on Input ####

   $('#amount').keyup ->
    if $('form').attr('action') == '/convert'
      $.ajax '/convert',
          type: 'GET'
          dataType: 'json'
          data: {
                  source_currency: $("#source_currency").val(),
                  target_currency: $("#target_currency").val(),
                  amount: $("#amount").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
        return false;