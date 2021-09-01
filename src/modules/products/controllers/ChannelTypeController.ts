import logger from '@shared/Log/customLog';
import { NextFunction, Request, Response } from 'express';
import ListTypeChannelService from '../services/ListTypeChannel';

export default class ChannelTypeController {
  public async channelTypeList(
    request: Request,
    response: Response,
    next: NextFunction,
  ): Promise<Response> {
    try {
      const listTypeChannel = new ListTypeChannelService();
      const typeChannel = await listTypeChannel.execute();

      logger.info(`Metethod channelTypeList Sucess`);

      return response.json(typeChannel);
    } catch (error) {
      next(error);
    }

    return response.status(200);
  }
}
