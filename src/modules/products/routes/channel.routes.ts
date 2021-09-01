import { Router } from 'express';
import ChannelsController from '../controllers/ChannelController';
import { celebrate, Joi, errors, Segments } from 'celebrate';
import ChannelTypeController from '../controllers/ChannelTypeController';
import AppError from '@shared/errors/AppError';

const channelsRouter = Router();
const channelController = new ChannelsController();
const channelTypeController = new ChannelTypeController();

channelsRouter.get('/Channel', channelController.channelList);

channelsRouter.get('/ChannelType/Type', channelTypeController.channelTypeList);

channelsRouter.get(
  '/Channel/:uuid',
  celebrate({
    [Segments.PARAMS]: {
      uuid: Joi.string().uuid().required(),
    },
  }),
  errors(new AppError('The uuid type requires a 36-character string', 400)),
  channelController.channelUuidList,
);

channelsRouter.post(
  '/Channel',
  celebrate({
    [Segments.BODY]: {
      name: Joi.string().required(),
      channelTypeUuid: Joi.string().uuid().required(),
      description: Joi.string().required(),
      auction: Joi.number().required(),
      config: Joi.string().required(),
    },
  }),
  errors(new AppError('Invalid key, see validation', 400)),
  channelController.channelCreate,
);

channelsRouter.put(
  '/channel/:uuid?',
  celebrate({
    [Segments.BODY]: {
      name: Joi.string().required(),
      description: Joi.string().required(),
      auction: Joi.number().required(),
      config: Joi.string().required(),
    },
    [Segments.PARAMS]: {
      uuid: Joi.string().uuid().required(),
    },
  }),
  errors(new AppError('Invalid key, see validation', 400)),
  channelController.channelUpdate,
);

channelsRouter.delete(
  '/Channel/:uuid',
  celebrate({
    [Segments.PARAMS]: {
      uuid: Joi.string().uuid().required(),
    },
  }),
  channelController.channelDelete,
);

export default channelsRouter;
