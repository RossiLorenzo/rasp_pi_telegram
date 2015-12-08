function on_msg_receive (msg)
      if msg.out then
          return
      end
      --If the keyword is info returns all the kwds
      if (string.lower(msg.text) == 'info') then
         send_text (msg.from.print_name, '/home/pi/Lorenzo/Telegram/info.txt', ok_cb, false)
      end
      --If the keyword is train returns all the trains live from Grand Canal Dock
      if (string.lower(msg.text) == 'train') then
         send_text (msg.from.print_name, '/home/pi/Lorenzo/Telegram/IrishRail/formatted.txt', ok_cb, false)
      end
      --If the keyword is weather returns the live weather for Londond, Dublin, Warsaw and Pisa
      if (string.lower(msg.text) == 'weather') then
         send_text (msg.from.print_name, '/home/pi/Lorenzo/Telegram/Weather/weather.txt', ok_cb, false)
      end
      --If the keyword is friday returns the time to next friday 6pm
      if (string.lower(msg.text) == 'friday') then
          timestamp = os.time()
          friday = 1389376800
          while timestamp > friday do
            friday = friday + (60 * 60 * 24 * 7 * 100)
          end
         send_msg (msg.from.print_name, print(friday - timestamp), ok_cb, false)
      end

  end
   
  function on_our_id (id)
  end
   
  function on_secret_chat_created (peer)
  end
   
  function on_user_update (user)
  end
   
  function on_chat_update (user)
  end
   
  function on_get_difference_end ()
  end
   
  function on_binlog_replay_end ()
  end
