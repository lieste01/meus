import AppError from '@shared/errors/AppError';
import logger from '@shared/Log/customLog';
import { getCustomRepository } from 'typeorm';
import { ChannelRepository } from '../typeorm/repositories/ChannelRepository';

interface IRequest {
  uuid: string;
}

class DeleteChannelService {
  public async execute({ uuid }: IRequest): Promise<void> {
    const channelRepository = getCustomRepository(ChannelRepository);
    const channel = await channelRepository.findOne(uuid);

    if (!channel) {
      throw new AppError(`Channel not found: ${uuid}`, 404);
    }

    channel.deletedAt = new Date();
    await channelRepository.save(channel);
  }
}

export default DeleteChannelService;
