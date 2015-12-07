function on_msg_receive (msg)
      if msg.out then
          return
      end
      --If the keyword is info returns all the 
      if (string.lower(msg.text) == 'info') then
         send_text (msg.from.print_name, '/home/pi/Lorenzo/Telegram/info.txt', ok_cb, false)
      end
      if (string.lower(msg.text) == 'train') then
         send_text (msg.from.print_name, '/home/pi/Lorenzo/Telegram/IrishRail/formatted.txt', ok_cb, false)
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
