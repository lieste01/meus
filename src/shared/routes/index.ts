import { Router } from 'express';
import channelsRouter from '@modules/products/routes/channel.routes';

const routes = Router();

routes.use('/channels', channelsRouter);

export default routes;
