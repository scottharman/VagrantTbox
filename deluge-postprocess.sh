TORRENT_ID=$1
TORRENT_NAME=$2
TORRENT_PATH=$3
echo filebot -script fn:amc --output "/streamer/Shows" --log-file "/vagrant/data/amc.log" --action copy --conflict override -non-strict --def subtitles=n artwork=y backdrops=y music=n  deleteAfterExtract=n clean=n "seriesFormat={n} {sxe} {t}" "ut_dir=$TORRENT_PATH/$TORRENT_NAME/" "ut_kind=multi" "ut_title=$TORRENT_NAME"  excludeList=amc-input.txt >> /vagrant/tbox.log
filebot -script fn:amc --output "/streamer/Shows" --log-file "/vagrant/data/amc.log" --action copy --conflict override -non-strict --def subtitles=n artwork=y backdrops=y music=n  deleteAfterExtract=n clean=n "seriesFormat={n} {sxe} {t}" "ut_dir=$TORRENT_PATH/$TORRENT_NAME/" "ut_kind=multi" "ut_title=$TORRENT_NAME"  excludeList=amc-input.txt
