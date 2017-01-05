//
//  KeyCode.h
//  BiggiFiVMGPlus
//
//  Created by xy on 13-2-7.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#ifndef BiggiFiVMGPlus_KeyCode_h
#define BiggiFiVMGPlus_KeyCode_h

typedef enum {
    MENU                = 59,           //菜单           
    HOME                = 102,          //主页
    
    BACK                = 1,            //返回
    
    SEARCH              = 217,          //搜索
    UP                  = 103,          //上
    DOWN                = 108,          //下
    LEFT                = 105,          //左
    RIGHT               = 106,          //右
    POWER               = 116,          //电源
    
    NOTIFICATION        = 61,           //通知
	CAMERA              = 172,          //摄像头
    //	key 62 CAMERA = F4;
	EMAIL               = 155,          //邮件
    //	key 63 = F5 = 63;
	MUSIC               = 171,          //音乐
    //	key 64 = F6 = 64;
	ZOOM_IN             = 165,          //
    //	#key 65	F7 = 65;
	MEDIA_PLAY_PAUSE    = 164,          //视频播放暂停
    //	#key 66	F8 = 66;
	ZOOM_OUT            = 163,          //
    //	#key 67	F9 = 67;
	MUTE                = 113,          //静音
    //	#key 68	F10 = 68;
	VOLUME_DOWN         = 114,          //音量减
    //	#key 87	F11 = 87;
	VOLUME_UP           = 115,          //音量加
    //	#key 88	F12 = 88;
    
	DEL                 = 14,           //删除
    //
//	ENTER               = 28,           //确认
    
	//手柄
    JOYPAD_KEY_ROCKER		= 0,        //
	JOYPAD_KEY_BUTTON_A		= 1,        //
	JOYPAD_KEY_BUTTON_B		= 2,        //
	JOYPAD_KEY_BUTTON_C		= 3,        //
	JOYPAD_KEY_BUTTON_D		= 4,        //
    JOYPAD_KEY_PAUSE		= 5,        //
    
}KEY_CODE;

typedef enum {
   	VMA_ALIVE_PORT      = 17890, 	    // scan VMA
    
	VMA_SCRSHOTSC_PORT  = 17891, 	    // receive the screen shot
    
	VMA_CMD_PORT        = 32980,		// mouse atcion, sensor and so on
    
	VMA_AUDIO_PORT      = 17893,		// audio port
    
	VMA_VIDEO_PORT      = 17894,		// video port
    
    VMA_WIFI_PORT       = 19999,        //config wifi
    
    VMA_ISWIFI_PORT     = 19998,        //is OFFLine
    
    
    //	private final int VMA_CTRL_PORT = 17895;		//detect VMA avlie 
}PORT;

typedef enum {
    MOUSE_ACTION_DOW = 0,
	MOUSE_ACTION_MOV = 1,
	MOUSE_ACTION_UPX = 2,
}MOUSE_ACTION;
typedef enum
{
    JOYPAD_ACTION_DOW = 0,
	JOYPAD_ACTION_UP = 1,
    
}JOYPAD_ACTION;
typedef enum {
    CMD_NACK    = -1,
	CMD_ACK     = 0,
	CMD_MOUSE_DOW = 1,     // mouse action
    CMD_MOUSE_UPX = 2,
    CMD_MOUSE_MOV = 3,
    
    CMD_TOUCH_PT1_DOW = 4, // multi-touch point one
	CMD_TOUCH_PT1_UPX = 5,
	CMD_TOUCH_PT1_MOV = 6,
    
	CMD_TOUCH_PT2_DOW = 7, // multi-touch point two
	CMD_TOUCH_PT2_UPX = 8,
	CMD_TOUCH_PT2_MOV = 9,
    
	CMD_MOBILE_KEY      = 10, // moblie key, menu, home,
    // back serch ...
	CMD_KEYBOARD_KEY    = 11, // key board, char and
    // number ...
	CMD_RESOLUTION      = 12, // VMG resolution
	CMD_SENSOR          = 13, // VMG sensor data
	CMD_SCRSHOTS_CAP    = 14, // screen shots capture
    
	CMD_VIB_FEEDBACK    = 15,	//vibrator feedback command
    
	CMD_VIDEO_OPEN      = 16,
	CMD_VIDEO_CLOSE     = 17,
	CMD_AUDIO_OPEN      = 18,
	CMD_AUDIO_CLOSE     = 19,
	CMD_LOGIN           = 20,
	CMD_LOGOFF          = 21,
	CMD_SENSOR_STOP     = 23,	
	CMD_SENSOR_START    = 24,
    
	CMD_JOYPAD_ROCKER	= 25,	
	CMD_JOYPAD_BUTTON	= 26,
	CMD_REQ_VMA_MODE	= 27,
    
	CMD_VMA_MODE		= 28,
    
	CMD_SET_VMA_MODE    = 29,
	CMD_VMA_ALIVE           = 30,
    
	CMD_MULTI_TOUCH_DOW     = 31,
	CMD_MULTI_TOUCH_UPX     = 32,
	CMD_MULTI_TOUCH_MOV     = 33,
	CMD_MULTI_TOUCH_DATA	= 34,
    
    
	CMD_AUDIO_SET_PARAMS	= 40,
	CMD_AUDIO_CLEAR_PARAMS  = 41,
	CMD_IME_OPEN			= 42,
    CMD_IME_CLOSE           = 45,
    
	CMD_VMA_HOST_VERSION	= 43,
    
    
    
    CMD_WANTHOTSFROMVMA     = 1000003,
    CMD_WANTHOTSFROMVMANEW  = 1000006,
    
    CMD_SENDHOTSFROMVMG     = 2000002,
    CMD_SENDHOTSFROMVMGNEW  = 2000006,
    
    CMD_CHECKHOTSFROMVMG    = 1000002,
    CMD_CONFIGWIFIOK        = 1000004,
    CMD_DEVICESNAMES        = 1000005,
    
    CMD_iSLangth            = 1000010,
    CMD_BEGINAGAIN          = 1000011,
    CMD_iSLangthTureOrFlase = 2000010,
    
    //CMD_CODE
	
}CMD_CODE;

//搜索 广播发送的数据
#define CMD_SEARCH  @"SCN_RANDOM"
//
#define BoardCastIP @"255.255.255.255"

#endif
