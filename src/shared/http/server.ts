import 'reflect-metadata';
import express, { NextFunction, Request, Response } from 'express';
import 'express-async-errors';
import cors from 'cors';
import routes from '../routes';
import AppError from '@shared/errors/AppError';
import '@shared/typeorm/connection';
import { errors } from 'celebrate';
import logger from '@shared/Log/customLog';

const app = express();

app.use(cors());
app.use(express.json());

app.use(routes);

app.use(errors());

app.use(
  (error: Error, request: Request, response: Response, next: NextFunction) => {
    if (error instanceof AppError) {
      logger.error(`${error.message}`);
      return response.status(error.statusCode).json({ message: error.message });
    }
    logger.error('Internal server error');
    return response.status(500).json({
      message: 'Internal server error',
    });
  },
);

app.listen(3333, () => {
  console.log('Servidor conectado na porta 3333! 🏆');
});
