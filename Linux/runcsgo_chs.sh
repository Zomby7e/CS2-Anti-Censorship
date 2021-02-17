#!/bin/bash

# 用于 GNU/Linux 系统的 CS:GO 工具脚本。
# 作者: Zomby7e

# CSGO 默认安装路径,如果脚本出错，可以修改为您设置的安装路径。
PATH_CSGO="/home/$USER/.local/share/Steam/steamapps/common/Counter-Strike Global Offensive/"

# 确认游戏是否正确安装。
if [ ! -f "${PATH_CSGO}csgo_linux64" ]
then
    echo 'Game has not been installed correctly.(Or this script did not find the game path)'
    exit 1
fi

# 将全部"和谐"文件重命名使其无效 (指令: a)
renameAll(){
    find "${PATH_CSGO}csgo/" -name "pakxv_*.vpk" -exec mv {} {}.bak \;
}

# 将"和谐"文件恢复原名 (命令: A)
restoreAll(){
    find "${PATH_CSGO}csgo/" -name "pakxv_*.vpk.bak" -print0 | while read -r -d '' RE_FILE
    do
        mv "$RE_FILE" "${RE_FILE::-4}"
    done
}

# 启动原版(国际版) CSGO (命令: w)
worldwide(){
    clear
    steam 'steam://rungameid/730//-worldwide -novid -tickrate 128' > /dev/null
    echo 'Good Luck & have fun!'
    exit 0
}

# 启动国服(完美世界版) CSGO (命令: p)
perfectworld(){
    renameAll
    steam 'steam://rungameid/730//-perfectworld -novid -tickrate 128' > /dev/null
    for COUNTDOWN in {20..0}
    do
        clear
        echo 'Good Luck & have fun!'
        echo "Please ignore this countdown: ${COUNTDOWN}"
        sleep 1
    done
    restoreAll
    clear
    echo 'Good Luck & have fun!'
    exit 0
}

# 下载你的 CSGO 配置文件 (命令: c)
configureFile(){
    # 如果您有配置文件，修改这个链接。
    wget "https://raw.githubusercontent.com/Zomby7e/csgo_config_cn/master/cfg_files/autoexec.cfg" -O "${PATH_CSGO}csgo/cfg/autoexec.cfg"
}

# 输出帮助信息 (命令: h)
help(){
less << EOF
简介

    1. 这个脚本可以快速地导入您的 CS:GO 配置文件，并快速地启动 CSGO。
    2. 打开脚本后，您进入了 TUI 模式 (终端用户界面), 直接输入命令代表的字母并回车即可。
    3. 你也可以由 CLI 的方式使用 (命令行界面), 就像这样:
    $ ./runcsgo_chs.sh w

参数

    w - 反和谐并启动完美世界 CS:GO，倒计时结束后恢复和谐。(避免更新游戏过程中损坏游戏文件)
    p - 启动国际版 CS:GO。
    a - 重命名相关文件，恢复红色血液。(仅限完美世界国服使用)
    A - 将所有文件恢复原名，确保更新不会出错。(仅限完美世界国服使用)
    c - 下载你的 CS:GO 配置文件到游戏路径下。
    h - 显示帮助信息。
    q - 退出。

FAQ

    Q: 我输入了"w" 或者 "p" 命令，为什么错误地启动了另一个版本?
    A: Steam 客户端内 CS:GO 的游戏参数仍然有效，将它们删除即可。

    Q: 启动国服为什么会有倒计时?
    A: 游戏会直接启动，不受倒计时影响。20 秒倒计时过后会恢复所有的"和谐"文件，避免后续游戏更新导致游戏文件损坏。

作者留言

    1.这个工具是为中国大陆人写的:
    "完美世界" 使用了几个"和谐"补丁 (vpk 文件) ，游戏会切换为中文语音并且导致血液变黑。这么做是为了通过中国政府的文化审查。只需将这些文件重命名，它们就会失效, 但是当游戏更新后, 游戏文件会损坏并且导致 bug 影响正常游玩。
    如果您使用这个工具启动国服 CS:GO, 这个工具会避免血液变黑并且恢复英语语音, 开启游戏后会恢复所有文件，不会导致游戏文件损坏。

    2.您可能需要修改 configureFile() 函数，把它修改为您自己的配置文件，这样会方便跨设备使用。如果游戏路径错误，您需要修改 PATH_CSGO 变量。

    3.`echo "祝你好运，游戏愉快, ${USER}!"`

(按 "q" 退出帮助页面)
EOF
}

# 如果输入参数, 那么禁用 TUI
[ ! -z $1 ] && TASK="q"

# CLI 流程控制语句
case $1 in
    w)
        worldwide;;
    p)
        perfectworld;;
    a)
        renameAll;;
    A)
        restoreAll;;
    c)
        configureFile;;
    h)
        help;;
    *)
        ;;
esac
# CLI 流程控制语句结束

# 主菜单部分(TUI)
while [ "$TASK" != "q" ]
do

clear
echo "CS:GO 简易工具"
echo ""
echo "输入 \"h\" 获取帮助"
echo ""
read -p "λ " TASK

case $TASK in
    w)
        worldwide;;
    p)
        perfectworld;;
    a)
        renameAll;;
    A)
        restoreAll;;
    c)
        configureFile;;
    h)
        help;;
    q)
        clear
        exit 0;;
    *)
        ;;
esac

done
# 主菜单部分(TUI)结束