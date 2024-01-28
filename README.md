# palworld-admin-bashscripts
palworld-admin-bashscripts
___

## Installation

1. clone git
2. install ARRCON
3. modify _config.sh file
4. add crontab schedule

### Scripts

| script                 | Description                                                         |
| ---------------------- | ------------------------------------------------------------------- |
| monitor.sh             | automatically shutdown game depends on memory usage                 |
| mem_usage_notifier.sh  | notify current memory usage to in-game world message                |
| backup.sh              | backup script and rotate files                                      |
| restart_in_1_min.sh    | force restart game after 1 minutes                                  |
| status.sh              | check current game status in bash scripts                           |

#### TZ identifiers

This setting affects logging output and the backup function. [TZ identifiers](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#Time_Zone_abbreviations) are format of defining a timezone near you. 

## Software used
- ARRCON - https://github.com/radj307/ARRCON
- Palworld Dedicated Server (APP-ID: 2394010 - https://steamdb.info/app/2394010/config/)