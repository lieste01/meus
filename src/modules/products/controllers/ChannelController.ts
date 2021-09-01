import { NextFunction, Request, Response } from 'express';
import CreateChannelService from '../services/CreateChannelService';
import DeleteChannelService from '../services/DeleteChannelService';
import ListChannelService from '../services/ListChannelService';
import ShowChannelService from '../services/ShowChannelService';
import UpdateChannelService from '../services/UpdateChannelService';
import logger from '@shared/Log/customLog';

export default class ChannelsController {
  public async channelList(
    request: Request,
    response: Response,
    next: NextFunction,
  ): Promise<Response> {
    try {
      const listChannel = new ListChannelService();
      const channel = await listChannel.execute();

      logger.info(`Metethod channelList sucess`);
      next();
      return response.json(channel);
    } catch (error) {
      next(error);
    }

    return response.status(200);
  }

  public async channelUuidList(
    request: Request,
    response: Response,
    next: NextFunction,
  ): Promise<Response> {
    const { uuid } = request.params;

    try {
      const showChannel = new ShowChannelService();
      const channel = await showChannel.execute({ uuid });

      logger.info(`Metethod channelUuidList sucess: ${uuid}`);

      next;
      return response.json(channel);
    } catch (error) {
      next(error);
    }

    return response.status(200);
  }

  public async channelCreate(
    request: Request,
    response: Response,
    next: NextFunction,
  ): Promise<Response> {
    const { name, channelTypeUuid, description, auction, config } =
      request.body;

    try {
      const createChannel = new CreateChannelService();
      const channel = await createChannel.execute({
        name,
        channelTypeUuid,
        description,
        auction,
        config,
      });

      logger.info(`Create is new channal`);

      next;
      return response.json(channel);
    } catch (error) {
      next(error);
    }

    return response.status(201);
  }

  public async channelUpdate(
    request: Request,
    response: Response,
    next: NextFunction,
  ): Promise<Response> {
    const { uuid } = request.params;
    const { name, channelTypeUuid, description, auction, config } =
      request.body;

    try {
      const updateChannel = new UpdateChannelService();

      const channel = await updateChannel.execute({
        uuid,
        name,
        channelTypeUuid,
        description,
        auction,
        config,
      });

      logger.info(`Update is channal for: ${uuid}`);

      next;
      return response.json(channel);
    } catch (error) {
      next(error);
    }

    return response.status(200);
  }

  public async channelDelete(
    request: Request,
    response: Response,
    next: NextFunction,
  ): Promise<Response> {
    const { uuid } = request.params;

    try {
      const deleteChannel = new DeleteChannelService();

      await deleteChannel.execute({ uuid });

      logger.info(`Delete channel for: ${uuid}`);

      next;
      return response.json({});
    } catch (error) {
      next(error);
    }

    return response.status(200);
  }
}
