// ボタンクリック時の処理
$('button').on('click', function() {
  $(this).hide();
  $(this).parents('td').find('div').addClass('loader')
});
