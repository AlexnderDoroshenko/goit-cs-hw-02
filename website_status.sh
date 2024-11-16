#!/bin/bash

# Масив з вебсайтами для перевірки
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Файл для збереження результатів
log_file="website_status.log"

# Очищення або створення лог файлу
> "$log_file"

# Перевірка кожного сайту
for website in "${websites[@]}"; do
  # Використовуємо curl для перевірки HTTP статусу (з урахуванням переадресацій)
  http_status=$(curl -s -o /dev/null -w "%{http_code}" --location "$website")
  
  # Якщо код відповіді 200, сайт доступний
  if [[ "$http_status" -eq 200 ]]; then
    echo "$website is UP" >> "$log_file"
  else
    echo "$website is DOWN (HTTP Status: $http_status)" >> "$log_file"
  fi
done

# Повідомлення про завершення
echo "Результати перевірки записано у файл: $log_file"
