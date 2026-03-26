FROM maven:3.9.11-eclipse-temurin-25 AS builder
WORKDIR /app
COPY . .

# Biên dịch code thành file .jar
RUN mvn package -DskipTests
 
# Giai đoạn 2: run
FROM eclipse-temurin:25-jre-jammy
WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar
EXPOSE 8080
# Lệnh "bật công tắc" để chạy ứng dụng
ENTRYPOINT [ "java", "-jar", "app.jar" ]
