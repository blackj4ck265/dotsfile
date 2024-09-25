

target_dir="/home/blackj4ck/video_wallpaper"



while true; do
    # 随机选择一个视频
    videos=("$target_dir"/*.mp4)
    rnum=$(( RANDOM % ${#videos[@]} ))

    # 获取视频高度
    height=$(mediainfo --Inform="Video;%Height%" "${videos[$rnum]}")

    # 选择命令选项
    if [ "$height" -ge 1600 ]; then
        options="--hwdec=auto --no-audio --loop --vf=crop=2560:1600"
    else
        options="--hwdec=auto --no-audio --loop --vf=crop=1728:1080"
    fi

    # 启动 mpvpaper
    mpvpaper eDP-2 -o "$options" "${videos[$rnum]}" &
    
    i=0  # 初始化计数器
    while [ $i -lt 600 ]; do
        fullscr=$(hyprctl activewindow -j | jq '.fullscreen')

        while [ $fullscr -eq 2 ]; do
            pkill mpvpaper
            sleep 3
            fullscr=$(hyprctl activewindow -j | jq '.fullscreen')
            if [ $fullscr -eq 0 ]; then
                sleep 1
                i=$((i + 1))
                mpvpaper eDP-2 -o "$options" "${videos[$rnum]}" &
            fi
        done
        
        sleep 10
        i=$((i + 10))
    done

    pkill mpvpaper
done


