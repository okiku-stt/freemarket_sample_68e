$(function(){
  // オプションの作成
  function append_option(category){
    var html = `<option value="${category.id}">${category.item}</option>`;
    return html;
  }
  // 子のセレクトボックス作成
  function append_children_box(insertHTML){ 
    var child_html = '';
    console.log("success")
    child_html = `<div class="sell-select-wrap" id="children_wrapper">
                    <div class="sell-select-icon">
                      <select class="sell-select-default" id="child_category" name="exhibition[categorys_id]">
                        <option value>---</option>
                        ${insertHTML}
                      </select>
                      <i class="fa fa-chevron-down sell-select-icon__allow"></i>
                    </div>
                    <div class="sell_select-grandchildren"></div>
                  </div>`
    $('.sell-select-children').append(child_html);
  }
  // 孫のセレクトボックス作成
  function append_grandchildren_box(insertHTML){
    var grandchildren_html = '';
    grandchildren_html = `<div class="sell-select-wrap" id= "grandchildren_wrapper">
                            <div class="sell-select-icon">
                              <select class="sell-select-default" id="grandchild_category" name="exhibition[categorys_id]">
                                <option value="">---</option>
                                ${insertHTML} 
                              </select>
                              <i class="fa fa-chevron-down sell-select-icon__allow"></i>
                            </div>
                          </div>`
    $('.sell_select-grandchildren').append(grandchildren_html);
  }
  // 親を選んで発火
  $(document).on('change', '#category_select', function(){
    var parent = document.getElementById('category_select').value; 
    if (parent != ''){
      $.ajax({
        url: '/exhibitions/category_children',
        type: 'GET',
        data: {
          parent: parent
        },
        dataType: 'json'
      })
      .done(function(data){
        var insertHTML = '';
        data.forEach(function(child){  
          insertHTML += append_option(child); 
          console.log(insertHTML)
        });
        append_children_box(insertHTML); 
        $(document).on('change', '#category_select', function(){
          // 子と孫を削除
          $('#children_wrapper').remove(); 
          $('#grandchildren_wrapper').remove();
        })
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
  });
  // 子を選んで発火
  $(document).on('change', '#child_category', function(){
    var child = document.getElementById('child_category').value;
    if (child != ''){
      $.ajax ({
        url: '/exhibitions/category_grandchildren',
        type: 'GET',
        data: {
          child: child
        },
        dataType: 'json'
      })
      .done(function(data){
        var insertHTML = '';
        data.forEach(function(grandchild){
          insertHTML += append_option(grandchild);
          });
          append_grandchildren_box(insertHTML);  
          $(document).on('change', '#child_category',function(){
            // 孫を削除
            $('#grandchildren_wrapper').remove();
            })
          })  
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
  });
});