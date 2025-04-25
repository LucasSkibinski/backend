import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  app.enableCors({
    origin: '*', // ou substitua por 'http://localhost:3001' se quiser mais seguro
  });

  const port = process.env.PORT ?? 3000;
  await app.listen(port, '0.0.0.0'); 
}
bootstrap();