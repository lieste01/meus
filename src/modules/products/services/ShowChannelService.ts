import AppError from '@shared/errors/AppError';
import { getCustomRepository } from 'typeorm';
import Channel from '../typeorm/entities/Channel';
import { ChannelRepository } from '../typeorm/repositories/ChannelRepository';

interface IRequest {
  uuid: string;
}

class ShowChannelService {
  public async execute({ uuid }: IRequest): Promise<Channel> {
    const channelRepository = getCustomRepository(ChannelRepository);

    const channel = await channelRepository.findOne(uuid);

    if (!channel) {
      throw new AppError(`Channel not found:  ${uuid}`, 404);
    }

    return channel;
  }
}

export default ShowChannelService;
