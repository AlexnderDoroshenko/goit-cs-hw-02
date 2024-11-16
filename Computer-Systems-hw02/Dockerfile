# Використовуємо Python 3.10 для контейнера
FROM python:3.11-slim

# Оновлення пакетів та встановлення необхідних залежностей
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && apt-get clean

# Створення робочої директорії в контейнері
WORKDIR /app

# Копіюємо файли проекту в контейнер
COPY . /app/

# Створюємо віртуальне середовище
RUN python -m venv /venv && . /venv/bin/activate

# Активуємо віртуальне середовище
ENV PATH="/app/venv/bin:$PATH"
RUN echo $PATH

# Встановлюємо залежності за допомогою pip з віртуального середовища
RUN pip3 install --no-cache-dir -r requirements.txt

# Відкриваємо порт 8000 для доступу
EXPOSE 8000
RUN echo  ls -la
# Запускаємо FastAPI через Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
