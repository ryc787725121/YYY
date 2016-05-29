
#import <UIKit/UIKit.h>


typedef enum {
    YCTopicTypeAll = 1,
    YCTopicTypePicture = 10,
    YCTopicTypeWord = 29,
    YCTopicTypeVoice = 31,
    YCTopicTypeVideo = 41
} YCTopicType;
 

/**   精华-所有顶部标题的高度 */
UIKIT_EXTERN CGFloat const XMGTitilesViewH;
/**   精华-所有顶部标题的的Y值 */
UIKIT_EXTERN CGFloat const XMGTitilesViewY;

/**   精华-cell --间距 */
UIKIT_EXTERN CGFloat const YCTopicCellMargin;
/**   精华-cell --底部工具条的高度 */
UIKIT_EXTERN CGFloat const YCTopicCellBottomBarH;
/**   精华-cell --文字内容的Y值 */
UIKIT_EXTERN  CGFloat const YCTopicCellTextY;

/** 精华-cell- 图片帖子的最大高度 */
UIKIT_EXTERN CGFloat const YCTopicCellPictureMaxH;
/** 精华-cell- 图片帖子一旦超过最大高度，就是用Break */
UIKIT_EXTERN CGFloat const YCTopicCellPictureBreakH;