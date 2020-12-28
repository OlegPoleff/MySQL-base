# Урок 5. Альтернативные СУБД и функциональные надстройки

-- 1. Установить и запустить СУБД PostgreSQL.

### Установка через Homebrew:
brew install postgres
### Добавляем в автозапуск при старте системы:
brew services start postgresql
### Также можно запустить вручную:
pg_ctl -D /usr/local/var/postgres start
### Ниже приведены примеры создания таблиц в PGAdmin:

