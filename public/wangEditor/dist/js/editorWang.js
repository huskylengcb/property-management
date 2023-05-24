function editorWang(menus) {
  var editor = new wangEditor('wangEditor-one');

  // 上传图片（举例）
  editor.config.uploadImgUrl = '/upload/wangedit';
  // editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024;
  // 配置自定义参数（举例）
  // editor.config.uploadParams = {
  //     token: 'abcdefg',
  //     user: 'wangfupeng1988'
  // }

  // 设置 headers（举例）
  editor.config.uploadHeaders = {
      "X-CSRF-Token": $("meta[name=\"csrf-token\"]").attr("content")
  };
  if (menus) {
    editor.config.menus = menus;
  } else{
      editor.config.menus = [
        'source',
        '|',
        'bold',
        'underline',
        'italic',
        'strikethrough',
        'eraser',
        'forecolor',
        'bgcolor',
        '|',
        'quote',
        'fontfamily',
        'fontsize',
        'head',
        'unorderlist',
        'orderlist',
        'alignleft',
        'aligncenter',
        'alignright',
        '|',
        'link',
        'unlink',
        'table',
        'emotion',
        '|',
        'img',
        'video',
        'location',
        'insertcode',
        '|',
        'undo',
        'redo',
        'fullscreen',
        '|',
        'lineheight',
        'indent'
    ];
  }

  // 隐藏掉插入网络图片功能。该配置，只有在你正确配置了图片上传功能之后才可用。
  editor.config.hideLinkImg = true;
  editor.config.uploadImgFileName = 'file'

  editor.create();
}